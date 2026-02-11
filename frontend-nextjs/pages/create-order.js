import { useState } from 'react';
import { createOrder } from '../services/api';

export default function CreateOrder() {
  const [product,setProduct]=useState(''); const [quantity,setQuantity]=useState(1);
  const handleSubmit=async e=>{ e.preventDefault(); await createOrder({customer_id:1,product_name:product,quantity,price:10,status:'new'}); };
  return <form onSubmit={handleSubmit}>
    <input value={product} onChange={e=>setProduct(e.target.value)} placeholder="Product"/>
    <input type="number" value={quantity} onChange={e=>setQuantity(Number(e.target.value))}/>
    <button type="submit">Create Order</button>
  </form>
}
