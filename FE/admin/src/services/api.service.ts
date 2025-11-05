import axios from "axios";

export default class ApiService {
  API_PATH = {
    EXAMPLE: `example/example`,
  };

  async get(url: string) {
    return await axios.get(url);
  }

  async post(url: string, data: any) {
    return await axios.post(url, data);
  }

  async put(url: string, data: any) {
    return await axios.put(url, data);
  }

  async delete(url: string, data: any) {
    return await axios.delete(url, data);
  }
}
