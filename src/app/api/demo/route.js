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



        // update
        const {searchParams} = new URL(req.url)
        const id = parseInt(searchParams.get('id'))
        const reqBody = await req.json()


        let userUp = await prisma.User.update({
            where:{id:id},
            data:{
                reqBody
            }
        })

        let PostUp = await prisma.Post.update({
            where:{id:id},
            data:{
                reqBody
            }
        })


        let CommentUp = await prisma.Comment.update({
            where:{id:id},
            data:{
                reqBody
            }
        })


        let TagUp = await prisma.Tag.update({
            where:{id:id},
            data:{
                reqBody
            }
        })

        let CategoryUp = await prisma.Category.update({
            where:{id:id},
            data:{
                reqBody
            }
        })


        let PostTagyUp = await prisma.PostTag.update({
            where:{id:id},
            data:{
                reqBody
            }
        })


        let PostCategoryUp = await prisma.PostCategory.update({
            where:{id:id},
            data:{
                reqBody
            }
        })

        let PostMetayUp = await prisma.PostMeta.update({
            where:{id:id},
            data:{
                reqBody
            }
        })


        // delete

        let userDel = await prisma.User.delete({
            where:{id:id},
        })

        let PostDel = await prisma.Post.delete({
            where:{id:id},
        })

        let CommentDel = await prisma.Comment.delete({
            where:{id:id},
        })

        let TagDel = await prisma.Tag.delete({
            where:{id:id},
        })


        let CategoryDel = await prisma.Category.delete({
            where:{id:id},
        })

        let PostTagDel = await prisma.PostTag.delete({
            where:{id:id},
        })
        
        let PostCategoryDel = await prisma.PostCategory.delete({
            where:{id:id},
        })

        let PostMetaDel = await prisma.PostMeta.delete({
            where:{id:id},
        })


        //find
        const findres = await prisma.User.findMany();

        const Postres = await prisma.Post.findMany();

        const Commentres = await prisma.Comment.findMany();

        const TagUres = await prisma.Tag.findMany();

        const CategoryRes = await prisma.Category.findMany();

        const PostTagRes = await prisma.PostTag.findMany();

        const PostCategoryRes = await prisma.PostCategory.findMany();

        const PostMetaRes = await prisma.PostMeta.findMany();



            return NextResponse.json( {status:'Success', data: result} )
        }

        catch (e) {
            return NextResponse.json( {status:'fail',data: e} )
        }


    

    
}