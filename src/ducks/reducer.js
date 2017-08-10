import axios from 'axios'
const initialState = {
    user: {},
    eventName:
}

const GETUSER='GETUSER'

export default function (state=initialState, action){
    switch (action.type) {
        case GETUSER + '_FULFILLED':
        console.log("user: ",action.payload)
          return Object.assign({},state, {
            user: action.payload
          })
        // case AMOUNTINPUT:
        //     return Object.assign({}, state, {
        //         value: action.payload
        //     })
        default:
            return state
    }
}

export function getUser(){
  let promise = axios.get('/api/main').then(res => res.data)
  console.log(promise)
  return {
    type: GETUSER,
    payload: promise
  }
}

export function eventInput(e){
    console.log(e.target.value)
    return {
        type: EVENTINPUT,
        payload: e.target.value
    }
}
