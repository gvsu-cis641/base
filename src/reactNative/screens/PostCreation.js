import React from 'react';
import { StyleSheet, Text, View} from 'react-native';
import { Input, NativeBaseProvider, Button} from 'native-base';
import { TextInput} from 'react-native-gesture-handler';
import { useNavigation } from '@react-navigation/native';

function PostCreation() {
  const navigation = useNavigation();
    return (
        <View style = {styles.container}>
            {/*TITLE OF THE SCREEN*/}
            <View style = {styles.Middle}>
                <Text style= {styles.PostText}>Post Creation</Text>
            </View>

            {/*DEATAILS OF THE RIDE*/}

          
        
        <View style={styles.emailInput}>       
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

          <View style={styles.buttonStyle}>
            <Button style={styles.buttonDesign}>
              CREATE POST
            </Button>
          </View>
        </View>
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
    container: {
      flex: 1,
      backgroundColor: '#fff',
    },
    PostText: {
      marginTop:100,
      fontSize:30,
      fontWeight:'bold',
    },
    Middle:{
      alignItems:'center',
      justifyContent:'center',
    },
    emailInput:{
      paddingLeft: 10,
      marginTop:50,
      marginRight:5
    },
    buttonStyle:{
      marginTop:30,
      marginLeft:15,
      marginRight:15
    },
    buttonDesign:{
      backgroundColor:'#026efd'
    }
  });

