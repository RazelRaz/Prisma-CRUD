import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

export async function POST(req,res){

    BigInt.prototype.toJSON = function () {
        return this.toString();
    };

    try {

        // const reqBody = await req.json()

        const prisma = new PrismaClient();

        

        let result = await prisma.User.create({
            
            data: {
                firstName: 'A',
                middleName: 'B',
                lastName: 'C',
                mobile: 'D',
                email: 'E@mail.com',
                passwordHash: 'F',
                profile: 'g',
                Post: {
                    create: {
                        title: 'A',
                        slug: 'B',
                        summary: 'C',
                        content: 'D',
                    }
                }
            }
        })

        let commentResult = await prisma.Comment.create({
            
            data: {
                title: 'A',
                content: 'B',                
            }
        })


        let TagResult = await prisma.Tag.create({
            
            data: {
                title: 'A',
                slug: 'B',
                metaTitle: 'A',
                content: 'B',              
            }
        })


        let CategoryResult = await prisma.Category.create({
            
            data: {
                title: 'A',
                slug: 'B',
                metaTitle: 'A',
                content: 'B',              
            }
        })


        let PostTag = await prisma.PostTag.create({
            
            data: {
                            
            }
        })

        let PostCategory = await prisma.PostCategory.create({
            
            data: {
                            
            }
        })

        let PostMeta = await prisma.PostMeta.create({
            
            data: {
                content: 'B',            
            }
        })

            return NextResponse.json( {status:'Success', data: result} )
        }

        catch (e) {
            return NextResponse.json( {status:'fail',data: e} )
        }



    //insert one

    // let data = await prisma.brands.create({
    //     data:{brandName:'Orange', brandImg:'orange1234.png'}
    // })

    //insert many
    // await prisma.brands.createMany({
    //     data:[
    //         {brandName:'Orange', brandImg:'orange1234.png'},
    //         {brandName:'apple', brandImg:'apple.png'},
    //         {brandName:'candy', brandImg:'candy.png'},
    //         {brandName:'cola', brandImg:'cola.png'},
    //         {brandName:'lemon', brandImg:'lemon.png'}
    //     ]
    // })

    //Find Many
    // const list = await prisma.brands.findMany();

    //update query (one)
    // await prisma.brands.update({
    //     where:{id:18},
    //     data:{brandName:'pink', brandImg:'pink.png'}
    // })


    //Delete query
    // await prisma.brands.delete({
    //     where:{id:18}
    // })


    //Find
    // const brands = await prisma.brands.findMany();
    // console.log(brands);


    
}