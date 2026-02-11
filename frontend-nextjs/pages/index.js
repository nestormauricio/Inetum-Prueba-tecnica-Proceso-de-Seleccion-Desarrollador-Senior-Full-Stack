
import {useEffect,useState} from "react"
import api from "../services/api"

export default function Home(){
 const [orders,setOrders]=useState([])
 const [page,setPage]=useState(1)

 useEffect(()=>{
  api.get(`/orders?customer_id=1&page=${page}`).then(r=>setOrders(r.data))
 },[page])

 return (
  <>
   <h1>Orders</h1>
   {orders.map(o=><div key={o.id}>{o.product_name}</div>)}
   <button onClick={()=>setPage(p=>p-1)} disabled={page==1}>Prev</button>
   <button onClick={()=>setPage(p=>p+1)}>Next</button>
  </>
 )
}
