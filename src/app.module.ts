import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ComplimentsModule } from './modules/compliments/compliments.module';
import { ComplimentsService } from './modules/compliments/compliments.service';
import { ComplimentsController } from './modules/compliments/compliments.controller';
import { ComplimentsModule } from './modules/compliments/compliments.module';

@Module({
  imports: [ComplimentsModule],
  controllers: [AppController, ComplimentsController],
  providers: [AppService, ComplimentsService],
})
export class AppModule {}
