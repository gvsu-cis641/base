import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView } from 'react-native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { FontAwesome5, MaterialCommunityIcons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { alignContent, flex, flexDirection, width } from 'styled-system';
import axios from 'axios';
import { useForm, Controller } from "react-hook-form";


function Signup() {
    const navigation = useNavigation();
    const {
      control, 
      handleSubmit, 
      formState: {errors, isValid}
    } = useForm();
    const url = 'http://3.138.37.61/sign_up';
    const submitSignUpForm = async (data) => {
      try {
        const response = await axios.post( url, data );
        console.log(response);
        alert( 'SignUp Success!' );
      } catch (err) {
        console.log(err);
      }
    }
  return (
    <ScrollView style={styles.scrollView}>
    <View style={styles.container}>
      <View style={styles.Middle}>
        <Text style={styles.LoginText}>Signup</Text>
      </View>
      <View style={styles.text2}>
        <Text>Already have account? </Text>
        <TouchableOpacity onPress={() => navigation.navigate("Login")} ><Text style={styles.signupText}> Login </Text></TouchableOpacity>
      </View>
      
      {/* First Name or Email Input Field */}
        <View style={styles.buttonStyle}>
        <Controller        
         control={control}        
         name="firstName"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.emailInput}>
            <Input
                value={value}
                onChangeText={value => onChange(value)}
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="id-card" />}
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
                placeholder="Enter Your First Name"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}
            />
            </View>    
         )} 
      />
        </View>

      {/* Last Name Input Field */}
        <View style={styles.buttonStyle}>
        <Controller        
         control={control}        
         name="lastName"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.emailInput}>
            <Input
                value={value}
                onChangeText={value => onChange(value)}
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="id-card" />}
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
                placeholder="Enter Your Last Name"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}
            />
            </View>    
         )} 
      />
        </View>
      

      {/* Username or Email Input Field */}
      <View style={styles.buttonStyleX}>
      <Controller        
         control={control}        
         name="email"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.emailInput}>
          <Input
            value={value}
            onChangeText={value => onChange(value)}
            InputLeftElement={
              <Icon
                as={<MaterialCommunityIcons name="email" />}
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
          />
        </View> 
         )} 
      />
      </View>

      {/* Password Input Field */}
      <View style={styles.buttonStyleX}>
      <Controller        
         control={control}        
         name="password"        
         render={({field: {onChange, value}}) => (            
          <View style={styles.emailInput}>
          <Input
            value={value}
            onChangeText={value => onChange(value)}
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
          />
        </View> 
         )} 
      />
      </View>  
        

      {/* Password Input Field */}
      <View style={styles.buttonStyleX}>
      <Controller        
         control={control}        
         name="passwordConfirm"        
         render={({field: {onChange, value}}) => (
          <View style={styles.emailInput}>
          <Input
            value={value}
            onChangeText={value => onChange(value)}
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
            placeholder="Confirm Password"
            _light={{
              placeholderTextColor: "blueGray.400",
            }}
            _dark={{
              placeholderTextColor: "blueGray.50",
            }}
          />
        </View>
         )} 
      />
      </View>

      {/* Vehicle Model Input Field */}
      <View style={styles.buttonStyleX}>
      <Controller        
         control={control}        
         name="vehicleModel"        
         render={({field: {onChange, value}}) => (
          <View style={styles.emailInput}>
          <Input
            value={value}
            onChangeText={value => onChange(value)}
            InputLeftElement={
              <Icon
                as={<FontAwesome5 name="car" />}
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
            secureTextEntry={false}
            placeholder="Enter Vehicle Model"
            _light={{
              placeholderTextColor: "blueGray.400",
            }}
            _dark={{
              placeholderTextColor: "blueGray.50",
            }}
          />
        </View>
         )} 
      />
      </View>

      {/* Vehicle Color Input Field */}
      <View style={styles.buttonStyleX}>
      <Controller        
         control={control}        
         name="vehicleColor"        
         render={({field: {onChange, value}}) => (
          <View style={styles.emailInput}>
          <Input
            value={value}
            onChangeText={value => onChange(value)}
            InputLeftElement={
              <Icon
                as={<FontAwesome5 name="paint-brush" />}
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
            secureTextEntry={false}
            placeholder="Enter Vehicle Color"
            _light={{
              placeholderTextColor: "blueGray.400",
            }}
            _dark={{
              placeholderTextColor: "blueGray.50",
            }}
          />
        </View>
         )} 
      />
      </View>


      {/* Phone Input Field */}
      <View style={styles.buttonStyleX}>
        <View style={styles.emailInput}>
        <Input
          value={value}
          onChangeText={value => onChange(value)}
          InputLeftElement={
            <Icon
              as={<FontAwesome5 name="location-arrow" />}
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
          secureTextEntry={false}
          placeholder="Enter Address"
          _light={{
            placeholderTextColor: "blueGray.400",
          }}
          _dark={{
            placeholderTextColor: "blueGray.50",
          }}
        />
      </View>
         )} 
      />
      </View>

      {/* Button */}
      <View style={styles.buttonStyle}>
        <Button style={styles.buttonDesign} type="submit" onPress={handleSubmit(submitSignUpForm)}>
            <Text style={styles.signupText}>REGISTER NOW</Text>
        </Button>
      </View>
    </View>
    </ScrollView>
  );
}

export default () => {
  return (
    <NativeBaseProvider>
     
        <Signup />
      
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
  scrollView:{
      marginVertical:45,
      backgroundColor: 'blue',
      flex: 1
      
  }
});
