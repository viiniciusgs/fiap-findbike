import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UsersModule } from './users/users.module';
import { AdressesModule } from './adresses/adresses.module';
import { StationsModule } from './stations/stations.module';
import { BikesModule } from './bikes/bikes.module';

@Module({
  imports: [PrismaModule, UsersModule, AdressesModule, StationsModule, BikesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
