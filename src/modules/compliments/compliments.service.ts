import { Injectable } from '@nestjs/common';
import { DynamoDB } from 'aws-sdk';

@Injectable()
export class ComplimentsService {
  private dynamoDb = new DynamoDB.DocumentClient();
  private tableName = 'ELOGIOS_IDEIAS';

  async createCompliment(data: any) {
    const params = {
      TableName: this.tableName,
      Item: {
        id: data.id,
        name: data.name,
        phone: data.phone,
        email: data.email,
        tip: data.tip,
      },
    };
    return this.dynamoDb.put(params).promise();
  }
}
