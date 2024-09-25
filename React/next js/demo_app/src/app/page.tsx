import Link from "next/link";

export default function Home(){
    return (
        <>
        <h1>Welcome</h1>
        <Link href="/blog">Blog</Link>
        {/* <Link href="/products" replace>Products</Link> */}
        <Link href="/products" >Products</Link>
        </>
    );
}

// replace will replace the page