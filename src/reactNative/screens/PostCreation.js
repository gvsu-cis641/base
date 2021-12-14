import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, ScrollView} from 'react-native';
import { Input, NativeBaseProvider, Button} from 'native-base';
import { TextInput} from 'react-native-gesture-handler';
import { useNavigation } from '@react-navigation/native';

function PostCreation() {
  const navigation = useNavigation();
    return (
      <View style={styles.page}>
        <ScrollView style = {styles.container}>
          <View style={styles.inputBigContainer}>
            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Ride Name"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
                />
            </View>

            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Departure Location"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
              />
            </View>

            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Destination"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
              />
            </View>

            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Time"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
              />
            </View>

            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Posted By"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
              />
            </View>

            <View style={styles.inputContainer}>
              <TextInput
                variant="outline"
                placeholder="Driver or Passenger?"
                _light={{
                  placeholderTextColor: "blueGray.400",
                }}
                _dark={{
                  placeholderTextColor: "blueGray.50",
                }}
              />
            </View>

          </View>

          <View style={styles.buttonStyle}>
            <Button style={styles.buttonDesign}
            type="submit"
            onPress={() => {
              alert("pressed");
            }} >
                Create
              </Button>
          </View>

          </ScrollView>


</View>
    );

}

export default () => {
  return (
    <NativeBaseProvider>

        <PostCreation/>

    </NativeBaseProvider>
  )
}


const styles = StyleSheet.create({
    page: {
      flex:1,
      flexDirection:"column",
    },

    container: {
      flex: 10,
      backgroundColor: '#fff',
    },

    PostText: {
      marginTop:30,
      fontSize:30,
      fontWeight:'bold',
    },

    inputBigContainer:{
      flex:10,
      marginTop:50,
      marginHorizontal:5
    },

    inputContainer: {
      height: 40,
      margin: 12,
      borderWidth: 1,
      padding: 10,
      borderWidth:1,
      borderRadius:5,
      borderColor:"gray"
    },

    buttonStyle:{
      flex:1,
      marginTop:30,
      marginLeft:15,
      marginRight:15
    },
    buttonDesign:{
      backgroundColor:'#026efd'
    },

    buttonContainer: {
      flex:1,
      position:"absolute",
      bottom:30,
      height:20,
      width:"100%",
    },

    buttonStyle:{
      marginTop:30,
      marginLeft:15,
      marginRight:15
    },

    buttonDesign:{
      backgroundColor:'#026efd'
    },
  });
