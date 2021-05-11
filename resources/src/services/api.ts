import axios from 'axios'

const baseURL = '/api'

const api = axios.create({
  baseURL,
})

api.interceptors.request.use(async function (requestConfig) {
  const userToken = localStorage.getItem('user:token')

  if (userToken) {
    requestConfig.headers.authorization = `Bearer ${userToken}`
    requestConfig.headers.accept = 'application/json'
  }

  return requestConfig
})

export default api
