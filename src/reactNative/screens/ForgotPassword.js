import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView,TouchableHighlight } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { borderLeft, height, style, textStyle } from 'styled-system';
import { FontAwesome5, MaterialCommunityIcons } from '@expo/vector-icons';
import { useForm, Controller } from "react-hook-form";

function ForgotPassword() {
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
    };
  return(
    <View style={styles.container}>
        
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
        
        <Button style={styles.buttonDesign}>
      <TouchableOpacity onPress={() => alert('Temporary Password sent to registered email address')}>
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