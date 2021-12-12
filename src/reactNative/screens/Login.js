import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { FontAwesome5 } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { alignContent, flex, flexDirection, width } from 'styled-system';
import axios from 'axios';
import { useForm, Controller } from "react-hook-form";
import AsyncStorage from '@react-native-async-storage/async-storage';


function Login() {
  const {
    control, 
    handleSubmit, 
    formState: {errors, isValid}
  } = useForm();
    const navigation = useNavigation();
    const url = 'http://3.138.37.61/sign_in';
    const submitLoginForm = async ( data ) => {
      try{
        const response = await axios.post( url, data );
        if ( response.data.result === 'success' ) {
          await AsyncStorage.setItem('email', response.data.email)
          // TODO: Implement page navigation to main page
          alert( 'login success!' );
        } else if ( response.data.result === 'user not found' ) {
          alert( 'No user is found. Please register' );
        } else if ( response.data.result === 'email unverified' ) {
          alert( 'Please first verify your email.' );
        }
      } catch ( err ) {
        if (err.response) {
          console.log(err);
      } else if (err.request) {
          console.log(err.request);
      } else {
          console.log('Error', err.message);
      }
      }
    } 

  return (
    <View style={styles.container}>
      <View style={styles.Middle}>
        <Text style={styles.LoginText}>ShareRide</Text>
      </View>
      

      {/* Username or Email Input Field */}
      <Controller        
         control={control}        
         name="email"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.buttonStyle}>
          <View style={styles.emailInput}>
            <Input
              InputLeftElement={
                <Icon
                  as={<FontAwesome5 name="envelope" />}
                  size="sm"
                  m={2}
                  _light={{
                    color: "black",
                  }}
                  _dark={{
                    color: "gray.300",
                  }}
                />
              }
              variant="outline"
              placeholder="Enter GVSU Email"
              _light={{
                placeholderTextColor: "blueGray.400",
              }}
              _dark={{
                placeholderTextColor: "blueGray.50",
              }}
             value={value}    
             onChangeText={value => onChange(value)}
            />
          </View>
        </View>      
         )} 
      />

      {/* Password Input Field */}
      <Controller        
         control={control}        
         name="password"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.buttonStyleX}>
        <View style={styles.emailInput}>
          <Input
            InputLeftElement={
              <Icon
                as={<FontAwesome5 name="key" />}
                size="sm"
                m={2}
                _light={{
                  color: "black",
                }}
                _dark={{
                  color: "gray.300",
                }}
              />
            }
            variant="outline"
            secureTextEntry={true}
            placeholder="Password"
            _light={{
              placeholderTextColor: "blueGray.400",
            }}
            _dark={{
              placeholderTextColor: "blueGray.50",
            }}
            value={value}    
            onChangeText={value => onChange(value)}
          />
        </View>
      </View>   
         )} 
      />
      

      {/* Button */}
      <View style={styles.buttonStyle}>
        <Button style={styles.buttonDesign} 
        type="submit" 
        onPress={
        handleSubmit(submitLoginForm)
        navigation.navigate("Profile")
        }>
            LOGIN
        </Button>
      </View>

      <View style={styles.text2}>
        <Text>Don't have an account? </Text>
        <TouchableOpacity onPress={() => navigation.navigate("Signup")} ><Text style={styles.signupText}>Sign up</Text></TouchableOpacity>
      </View>

      <View style={styles.text2}>
        <Text>Have acc </Text>
        <TouchableOpacity onPress={() => navigation.navigate("Profile")} ><Text style={styles.signupText}> Profile</Text></TouchableOpacity>
      </View>      
      
    </View>
  );
}

export default () => {
  return (
    <NativeBaseProvider>
     
        <Login />
      
    </NativeBaseProvider>
  )
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  LoginText: {
    marginTop:100,
    fontSize:30,
    fontWeight:'bold',
  },
  Middle:{
    alignItems:'center',
    justifyContent:'center',
  },
  text2:{
    flexDirection:'row',
    justifyContent:'center',
    paddingTop:5
  },
  signupText:{
    fontWeight:'bold'
  },
  emailField:{
    marginTop:30,
    marginLeft:15
  },
  emailInput:{
    marginTop:10,
    marginRight:5
  },
  buttonStyle:{
    marginTop:30,
    marginLeft:15,
    marginRight:15
  },
  buttonStyleX:{
    marginTop:12,
    marginLeft:15,
    marginRight:15
  },
  buttonDesign:{
    backgroundColor:'#026efd'
  },
  lineStyle:{
    flexDirection:'row',
    marginTop:30,
    marginLeft:15,
    marginRight:15,
    alignItems:'center'
  },
  imageStyle:{
    width:80,
    height:80,
    marginLeft:20,
  },
  boxStyle:{
    flexDirection:'row',
    marginTop:30,
    marginLeft:15,
    marginRight:15,
    justifyContent:'space-around'
  },
});
