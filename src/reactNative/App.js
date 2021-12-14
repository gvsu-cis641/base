import React from 'react';

import Login from './screens/Login';
import Signup from './screens/Signup';
import Profile from './screens/Profile';
import EditProfile  from './screens/EditProfile';
import Post from './screens/Post'
import PostCreation from './screens/PostCreation';
import Help from './screens/Help'
import ForgotPassword from './screens/ForgotPassword'
import Logout from './screens/Logout'


import { NavigationContainer } from '@react-navigation/native';
import { createDrawerNavigator,DrawerContentScrollView,
  DrawerItemList,
  DrawerItem, } from '@react-navigation/drawer';

function CustomDrawerContent(props) {
  return (
    <DrawerContentScrollView {...props}>
      <DrawerItemList {...props} />
      <DrawerItem label="Help" onPress={() => alert('Link to help')} />
    </DrawerContentScrollView>
    );
  }
const Drawer = createDrawerNavigator();

function MyDrawer() {
  return (
    <Drawer.Navigator
    drawerContent={(props) => <CustomDrawerContent {...props} />}
    >

      <Drawer.Screen name="Login" component={Login} />
      <Drawer.Screen name="Signup" component={Signup} />
      <Drawer.Screen name="ForgotPassword" component={ForgotPassword} />
      <Drawer.Screen name="Profile" component={Profile} />
      <Drawer.Screen name="EditProfile" component={EditProfile} />
      <Drawer.Screen name="Post" component={Post} />
      <Drawer.Screen name="Create ride" component={PostCreation}/>
      <Drawer.Screen name="Help" component={Help} />
      <Drawer.Screen name="Logout" component={Logout} />
    </Drawer.Navigator>
  );
}

export default function App() {
  return (
    <NavigationContainer>

        <MyDrawer />

    </NavigationContainer>
  );
}
