import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView,TouchableHighlight } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { Input, NativeBaseProvider, Button, Icon, Box, Image, AspectRatio } from 'native-base';
import { height, style } from 'styled-system';
import { FontAwesome5, MaterialCommunityIcons } from '@expo/vector-icons';

function EditProfile() {
    const navigation = useNavigation();
  return(
    <View style={styles.container}>
        <View style = {{flexDirection:'center', alignItems:'center', marginTop:20}}>
            <Image style={{height: 200, width:200, backgroundColor:'black'}} source={require('../assets/NewLogo1.png')}></Image>
        </View>
        
        <View style={styles.buttonStyle}>
        
            <View style={styles.emailInput}>
            <Input
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="id-card" />}
                    size="md"
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
                placeholder="Enter Your Phone Number"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}

            />
            <Input
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="location-arrow" />}
                    size="md"
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
                placeholder="Enter Your Address"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}

            />
            <Input
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="paint-brush" />}
                    size="md"
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
                placeholder="Enter Your Vechile Colour"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}

            />
            <Input
                InputLeftElement={
                <Icon
                    as={<FontAwesome5 name="car" />}
                    size="md"
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
                placeholder="Enter Your Vechile Model"
                _light={{
                placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                placeholderTextColor: "blueGray.50",
                }}

            />
            </View>
        </View>
    
    </View>
    );
};

export default () => {
    return (
      <NativeBaseProvider>
       
          <EditProfile />
        
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
        marginRight:5
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
});
