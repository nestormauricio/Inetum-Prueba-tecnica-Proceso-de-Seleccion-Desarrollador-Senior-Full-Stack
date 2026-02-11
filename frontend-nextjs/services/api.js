import axios from 'axios';
const api = axios.create({ baseURL: 'http://localhost:3000' });
export const createOrder = order => api.post('/orders',order);
export const getOrders = (customerId,page) => api.get('/orders',{ params: {customer_id:customerId,page} });
