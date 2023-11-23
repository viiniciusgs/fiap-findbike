import { Module } from '@nestjs/common';
import { PrismaModule } from '../prisma/prisma.module';
import { BikesController } from './bikes.controller';
import { BikesService } from './bikes.service';

@Module({
  controllers: [BikesController],
  providers: [BikesService],
  imports: [PrismaModule],
})
export class BikesModule {}
