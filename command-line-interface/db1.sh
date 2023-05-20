#!/bin/bash
assign_default_if_empty() {
    if [[ -z $1 ]]; then
        echo $2
    else
        echo $1
    fi
}
DB_ENGINE=$(assigned_default_if_empty $1 'mysql')
DB_INSTANCE_CLASS=$(assigned_default_if_empty $2 'db.t3.micro')
DBINSTANCE_IDENTIFIER=$(assigned_default_if_empty $3 'mysql-db-instance')
DB_NAME=$(assigned_default_if_empty $4 'mysqldb')
USER_NAME=$(assign_default_if_empty $5 'root')
USER_PASSWORD=$(assign_default_if_empty $6 'rootroot')
SIZE_IN_GB=$(assign_default_if_empty $7 '20')
DISPLAY_OUTPUT=$(assign_default_if_empty $8 'no')
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=is-default,Values=true" --query "Vpcs[0].VpcId" --output text)"
echo "Found default vpc with id ${VPC_ID}"
SG_COUNT=$(aws ec2 describe-security-groups --query "length(SecurityGroups[?GroupName=='mysqlsg'])")
if [[ $SG_COUNT == "0" ]]; then
    SG_ID=$(aws ec2 create-security-group \
        --description "rds mysql security group" \
        --group-name "mysqlsg" \
        --vpc-id ${VPC_ID}\
        --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=mysqlsg}]" \
        --query "GroupId" \
        --output text)
    echo "Created security group with id ${SG_ID}"
     OUTPUT=$(aws ec2 authorize-security-group-ingress \
        --group-id ${SG_ID} \
        --protocol tcp \
        --port 3306 \
        --cidr 0.0.0.0/0)
     if [[ $DISPLAY_OUTPUT != "NO" ]]; then
        echo $OUTPUT

    fi
else
    SG_ID=$(aws ec2 describe-security-groups \
        --query "SecurityGroups[?GroupName=='mysqlsg'].GroupId" \
        --output text)
    echo "Found security group with id ${SG_ID}"
fi
else
    SG_ID=$(aws ec2 describe-security-groups \
        --query "SecurityGroups[?GroupName=='mysqlsg'].GroupId" \
        --output text)
    echo "Found security group with id ${SG_ID}"
fi

exit 0
OUTPUT=$(aws rds create-db-instance \
   --db-name ${DB_NAME} \
   --db-instance-identifier ${DBINSTANCE_IDENTIFIER} \
   --allocated-storage ${SIZE_IN_GB} \
   --db-instance-class ${DB_INSTANCE_CLASS} \
   --engine ${DB_ENGINE} \
   --master-username ${USER_NAME} \
   --master-user-password ${USER_PASSWORD} \
   --backup-retention-period 0 \
   --no-multi-az \
   --no-auto-minor-version-upgrade \
   --publicly-accessible \
   --vpc-security-group-ids ${SG_ID})

if [[ $DISPLAY_OUTPUT != "NO" ]]; then
    echo $OUTPUT
fi
