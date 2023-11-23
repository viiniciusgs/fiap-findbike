import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAdressDto } from './dto/create-adress.dto';
import { UpdateAdressDto } from './dto/update-adress.dto';

@Injectable()
export class AdressesService {
  constructor(private prisma: PrismaService) {}

  create(createAdressDto: CreateAdressDto) {
    return this.prisma.address.create({ data: createAdressDto });
  }

  findAll() {
    return this.prisma.address.findMany();
  }

  update(id: number, updateAdressDto: UpdateAdressDto) {
    return this.prisma.address.update({ where: { id }, data: updateAdressDto });
  }

  async remove(id: number) {
    await this.prisma.address.delete({ where: { id } });
  }
}
