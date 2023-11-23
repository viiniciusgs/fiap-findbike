import { Module } from '@nestjs/common';
import { PrismaModule } from '../prisma/prisma.module';
import { AdressesController } from './adresses.controller';
import { AdressesService } from './adresses.service';

@Module({
  controllers: [AdressesController],
  providers: [AdressesService],
  imports: [PrismaModule],
})
export class AdressesModule {}
