import { Module } from '@nestjs/common';
import { PrismaModule } from '../prisma/prisma.module';
import { StationsController } from './stations.controller';
import { StationsService } from './stations.service';

@Module({
  controllers: [StationsController],
  providers: [StationsService],
  imports: [PrismaModule],
})
export class StationsModule {}
