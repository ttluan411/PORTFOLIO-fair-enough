import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Landing from './Landing/Landing';
import MainPage from './MainPage/MainPage';
export default (
    <Switch>
         <Route component= { MainPage } path="/main" /> 
        
         {/* <Route component= { Landing } exact path="/" />  */}
        {/*/*<Route component= { Login } path="/login" />*/}
        {/*<Route component= { FriendList } path="/friendlist" /> 
        <Route component= { EventList } path="/eventlist" />
        <Route component= { BillList } path="/billlist" />
        <Route component= { CreateEvent } path="/createevent" />
        {/*<Route component= { CreateBill } path="/createbill" />*/}
    </Switch>
)