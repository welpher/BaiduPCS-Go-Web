import fetch from "@/utils/fetch";

const API_URL = "/command";

export default {
  run(cmd, psw) {
    return fetch({
        url: API_URL,
        method: "post",
        data: {
          cmd,
          psw
        }
      })
      .then(data => {
        if (data.data.data.includes('错误')) {
          return Promise.reject({
            data: {
              msg: '请使用 login -bduss=YOURBUDSS 来登录你的百度云盘'
            }
          });
        }
        return Promise.resolve(data);
      })

  }
};
