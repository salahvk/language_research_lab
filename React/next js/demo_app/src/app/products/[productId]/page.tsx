import { Metadata } from "next";

type Props = {
  params: { productId: string };
};

//  you can also modify this async value
export const generateMetadata =({params}:Props) :Metadata =>{
  return{
    title:`Product ${params.productId}`
  }
}

export default function ProductDetails({ params }: Props) {
  return <h1>Details about product {params.productId}</h1>;
}
