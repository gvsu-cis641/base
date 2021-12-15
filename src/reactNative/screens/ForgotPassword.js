import React, { useState } from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView,TouchableHighlight } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { borderLeft, height, style, textStyle } from 'styled-system';
import { FontAwesome5, MaterialCommunityIcons } from '@expo/vector-icons';
import { useForm, Controller } from "react-hook-form";
import axios from 'axios';

function ForgotPassword() {
  const [email, setEmail] = useState('');
    const navigation = useNavigation();
    const url = 'http://3.138.37.61/forgot_password';
    const sendTempPassword = () => {
      const param = { 'email': email}
      axios.post(url, param)
      .then( () => {
        alert('Temporary Password sent to registered email address')
      })
    };
  return(
    <View style={styles.container}>
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
             value={email}    
             onChangeText={value => setEmail(value)}
            />
          </View>
        </View>
        {/* Username or Email Input Field */}
        
        <Button style={styles.buttonDesign}>
      <TouchableOpacity onPress={() => sendTempPassword()}>
        <Text style={styles.signupText}> Reset Password</Text></TouchableOpacity>
      </Button> 

    </View>
    );
};

export default () => {
    return (
      <NativeBaseProvider>
       
          <ForgotPassword />
        
      </NativeBaseProvider>
    );
}

const styles= StyleSheet.create({
    container:{
        flex:1,
        backgroundColor: 'white',
        padding: 10,
    },
    emailField:{
        marginTop:30,
        marginLeft:15
    },
    emailInput:{
        marginTop:10,
        marginRight:5,
        fontWeight:'bold',
        padding:20
    },
    ListItem:{
        width: '100%',
        height: 50,
        paddingHorizontal: 15,
        alignItems: 'center'
    },
    buttonStyleX:{
        marginTop:12,
        marginLeft:15,
        marginRight:15
    },
    buttonDesign:{
        backgroundColor:'#026efd'
    },
    buttonStyle:{
        marginTop:15,
        marginLeft:15,
        marginRight:15
    },
    signupText:{
        fontWeight:'bold'
    },
});