import { Module } from '@nestjs/common';
import { ComplimentsService } from './compliments.service';
import { ComplimentsController } from './compliments.controller';
import { DynamoService } from 'src/shred/dynamo.service';

@Module({
  controllers: [ComplimentsController],
  providers: [ComplimentsService, DynamoService],
})
export class ComplimentsModule {}
