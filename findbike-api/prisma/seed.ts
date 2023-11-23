import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const address1 = await prisma.address.upsert({
    where: { id: 1 },
    update: {},
    create: {
      postalCode: '123456',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Bela Vista',
      street: 'Av. Paulista',
      latitude: 123,
      longitude: 456,
      Station: {
        create: {
          name: 'Station 1',
          Bike: {
            create: [
              {
                available: true,
              },
              {
                available: true,
              },
              {
                available: true,
              },
            ],
          },
        },
      },
    },
  });
  console.log('🚀 ~ file: seed.ts:37 ~ main ~ address1:', address1);

  const address2 = await prisma.address.upsert({
    where: { id: 2 },
    update: {},
    create: {
      postalCode: '123456',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Bela Vista',
      street: 'Av. Paulista',
      latitude: 123,
      longitude: 789,
      Station: {
        create: {
          name: 'Station 2',
          Bike: {
            create: [
              {
                available: true,
              },
              {
                available: true,
              },
              {
                available: true,
              },
            ],
          },
        },
      },
    },
  });
  console.log('🚀 ~ file: seed.ts:70 ~ main ~ address2:', address2);

  const address3 = await prisma.address.upsert({
    where: { id: 3 },
    update: {},
    create: {
      postalCode: '123456',
      state: 'SP',
      city: 'São Paulo',
      neighborhood: 'Bela Vista',
      street: 'Av. Paulista',
      latitude: 456,
      longitude: 123,
      Station: {
        create: {
          name: 'Station 3',
          Bike: {
            create: [
              {
                available: true,
              },
              {
                available: true,
              },
              {
                available: true,
              },
            ],
          },
        },
      },
    },
  });
  console.log('🚀 ~ file: seed.ts:103 ~ main ~ address3:', address3);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
