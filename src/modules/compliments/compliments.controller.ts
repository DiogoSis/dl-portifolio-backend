import { Body, Controller, Post } from '@nestjs/common';
import { ComplimentsService } from './compliments.service';
import { CreateComplimentDto } from './dtos/create-compliment.dto';

@Controller('compliments')
export class ComplimentsController {
  constructor(private readonly complimentsService: ComplimentsService) {}

  @Post()
  async createCompliment(@Body() createComplimentDto: CreateComplimentDto) {
    return this.complimentsService.createCompliment(createComplimentDto);
  }
}
