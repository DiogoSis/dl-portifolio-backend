import { Injectable } from '@nestjs/common';
import AWS from 'aws-sdk';
import { DocumentClient } from 'aws-sdk/clients/dynamodb';

@Injectable()
export class DynamoService {
  private readonly dynamoClient: DocumentClient;

  constructor() {
    this.dynamoClient = new AWS.DynamoDB.DocumentClient();
  }

  async putItem(tableName: string, item: Record<string, any>): Promise<any> {
    const params: DocumentClient.PutItemInput = {
      TableName: tableName,
      Item: item,
    };
    try {
      await this.dynamoClient.put(params).promise();
      return { message: 'Item adicionado com sucesso!' };
    } catch (error) {
      throw new Error('Erro ao adicionar item: ' + error.message);
    }
  }
}
