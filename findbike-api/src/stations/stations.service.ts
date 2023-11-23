import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateStationDto } from './dto/create-station.dto';
import { UpdateStationDto } from './dto/update-station.dto';

@Injectable()
export class StationsService {
  constructor(private readonly prisma: PrismaService) {}

  create(createStationDto: CreateStationDto) {
    return this.prisma.station.create({ data: createStationDto });
  }

  findAll() {
    return this.prisma.station.findMany();
  }

  update(id: number, updateStationDto: UpdateStationDto) {
    return this.prisma.station.update({
      where: { id },
      data: updateStationDto,
    });
  }

  async remove(id: number) {
    await this.prisma.station.delete({ where: { id } });
  }
}
