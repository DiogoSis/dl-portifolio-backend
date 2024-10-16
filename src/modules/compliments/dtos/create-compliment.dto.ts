import { IsString, IsNotEmpty } from 'class-validator';

export class CreateComplimentDto {
  @IsString()
  @IsNotEmpty()
  tip: string;
}
