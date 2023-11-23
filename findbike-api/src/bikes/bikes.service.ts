import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateBikeDto } from './dto/create-bike.dto';
import { UpdateBikeDto } from './dto/update-bike.dto';

@Injectable()
export class BikesService {
  constructor(private readonly prisma: PrismaService) {}

  create(createBikeDto: CreateBikeDto) {
    return this.prisma.bike.create({ data: createBikeDto });
  }

  findAll() {
    return this.prisma.bike.findMany();
  }

  update(id: number, updateBikeDto: UpdateBikeDto) {
    return this.prisma.bike.update({ where: { id }, data: updateBikeDto });
  }

  remove(id: number) {
    return this.prisma.bike.delete({ where: { id } });
  }
}
