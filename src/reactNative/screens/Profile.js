import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView,TouchableHighlight } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { borderLeft, height, style, textStyle } from 'styled-system';
import { FontAwesome5, MaterialCommunityIcons } from '@expo/vector-icons';

function Profile() {
    const navigation = useNavigation();
  return(
    <View style={styles.container}>
        <View style = {{flexDirection:'center', alignItems:'center', marginTop:20}}>
            <Image style={{height: 200, width:200, backgroundColor:'black'}} source={require('../assets/NewLogo1.png')}></Image>
        </View>
        <View style={styles.buttonStyle}>
          <TouchableOpacity style={styles.buttonDesign} onPress={() => navigation.navigate("EditProfile")}>
            
              <Text style={styles.signupText}>Edit Profile</Text>
            
          </TouchableOpacity>
        </View>
        
        <View style={styles.emailInput}>
            <Text> Profile Name </Text>
        </View>

        <View style={styles.emailInput}>
            <Text> Phone Number </Text>
        </View>

        <View style={styles.emailInput}>
            <Text> Address </Text>
        </View>

        <View style={styles.emailInput}>
            <Text> Vehicle Model </Text>
        </View>

        <View style={styles.emailInput}>
            <Text> Vehicle Color </Text>
        </View>
    
    </View>
    );
};

export default () => {
    return (
      <NativeBaseProvider>
       
          <Profile />
        
      </NativeBaseProvider>
    )
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
        textStyle:'bold',
        padding:20
    },
    ListItem:{
        width: '100%',
        height: 50,
        paddingHorizontal: 15,
        alignItems: 'center'
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