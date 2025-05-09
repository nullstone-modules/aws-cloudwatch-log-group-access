# aws-cloudwatch-log-group-access

A Nullstone application for AWS comes with Cloudwatch built-in. 
Use this only if you want an additional store for logs.
This enables a Nullstone application to read/write/admin a Cloudwatch log group.

This capability injects `CLOUDWATCH_LOG_GROUP` environment variable into your application for the connection Cloudwatch log group.
It also gives the AWS role injected into your application access to read/write/admin the Cloudwatch log group.
