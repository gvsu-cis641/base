import React, { useEffect, useState } from 'react';
import { SafeAreaView, View, FlatList, StyleSheet, Text, StatusBar, TouchableOpacity, ScrollView, Icon } from 'react-native';
import { width } from 'styled-system';
import { useNavigation } from '@react-navigation/native';
import { Foundation, MaterialCommunityIcons  } from '@expo/vector-icons';

import axios from 'axios';


const DATA = [
  {
    id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
    title: 'Post 1',
  },
  {
    id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
    title: 'Post 2',
  },
  {
    id: '58694a0f-3da1-471f-bd96-145571e29d72',
    title: 'Post 3',
  },
];

const Item = ({ title }) => (
  <View style={styles.item}>
    <Text style={styles.title}>{title}</Text>
  </View>
);



const App = () => {
    const navigation = useNavigation();
  const renderItem = ({ item }) => (
    <Item title={item.title} />
  );
  const [data, setData] = useState([]);
  useEffect(() => {
    fetch('http://3.138.37.61/posts')
      .then((response) => response.json())
      .then((json) => setData(json))

      .catch((error) => console.error(error))
  }, []);

  return (
    <SafeAreaView style={styles.container}>



      <ScrollView>
        <View style={styles.eventBigContainer}>
        <FlatList
          data={data}
          keyExtractor={({ postId }, index) => postId}
          renderItem={({ item }) => (
            <TouchableOpacity
              onPress={() => navigation.navigate('Create ride')}>

              <View style={styles.eventContainer}>

                <View style={styles.eventContainerLeft}>
                  <View style={styles.eventContainerCreatedBy}>
                    <Text>Departure: {item.source}</Text>
                    <Text>Arrival: {item.destination}</Text>
                  </View>

                  <View style={styles.eventContainerTime}>
                    <Text>{Date(item.time)}</Text>
                  </View>
                </View>

                <View style={styles.eventContainerRight}>
                  <TouchableOpacity
                    onPress={() => alert("hello pressed")}>
                    <View style={styles.eventContainerEdit}>
                      <MaterialCommunityIcons name="pencil" size={20} color="black" />
                    </View>
                  </TouchableOpacity>

                  <TouchableOpacity
                    onPress={() => alert("delete pressed")}>
                    <View style={styles.eventContainerDelete}>
                      <Foundation name="x" size={20} color="black" />
                    </View>
                  </TouchableOpacity>

                  <View style={styles.eventContainerSeats}>
                    <Text>{item.passengers.length} / {item.totalSeats}</Text>
                  </View>
                </View>

              </View>
            </TouchableOpacity>
              )}
              />
              </View>
        </ScrollView>

          <View style={styles.plusIconWrapper}>
            <TouchableOpacity
              onPress={() => navigation.navigate("Create ride")}
              style={styles.plusButton}>
              <Text style={styles.plus}>+</Text>
            </TouchableOpacity>
          </View>

        </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  item: {
    backgroundColor: '#f9c2ff',
    padding: 20,
    marginVertical: 8,
    marginHorizontal: 16,
  },
  title: {
    fontSize: 32,
  },
  buttonStyle:{
    marginTop:30,
    marginLeft:15,
    marginRight:15,

  },
  buttonStyleX:{
    marginTop:12,
    marginLeft:15,
    marginRight:15
  },
  buttonDesign:{
    backgroundColor:'#026efd'
  },
  signupText:{
    fontWeight:'bold'
  },

  plusIconWrapper:{
    flex: 1,
    padding: 30,
    position: "absolute",
    bottom:0,
    alignSelf: "flex-end",
  },

  plusButton: {
    borderColor: '#fff',
    alignItems: 'center',
    width: 70,
    height: 71,
    backgroundColor: '#3333FF',
    borderRadius: 70,
  },

  plus: {
    fontSize: 55,
    fontWeight: 'bold',
    color: '#fff',
    alignSelf:'center',
    bottom: 2,
  },


  eventBigContainer: {
    borderRadius:5,
    marginHorizontal:15,
  },

  eventContainer: {
    flex:1,
    height:100,
    flexDirection:"row",
    borderBottomWidth:1,
    borderWidth:1,
    margin:10,
    borderRadius:10,
  },

  eventContainerLeft: {
    flex:8,
  },

  eventContainerRight: {
    flex:3,
  },

  eventContainerCreatedBy: {
    flex:1,
    position:"absolute",
    top:15,
    left:20,
  },

  eventContainerTime: {
    flex:1,
    position:"absolute",
    bottom:15,
    left:20,
  },

  eventContainerEdit: {
    flex:1,
    position:"absolute",
    top:15,
    right:50,
  },

  eventContainerDelete: {
    flex:1,
    position:"absolute",
    top:15,
    right:20,
  },

  eventContainerSeats: {
    flex:1,
    position:"absolute",
    bottom:15,
    right:20,
  },
});

export default App;
