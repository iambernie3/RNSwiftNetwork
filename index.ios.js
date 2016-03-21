/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  View
} from 'react-native';

var {

    CheckNetwork
} = require('NativeModules');



class RNSwiftCheckNetwork extends Component {

  constructor(props){
      super(props);
      this.state = {
        isConnected: '' 
      };
  }

  check(){
     var self = this;
     CheckNetwork.isConnectedToNetwork(function(con){
        console.log("result: "+con)
        if (con){
             self.setState({
                isConnected: 'true'
             });
        }else{
              self.setState({
                isConnected: 'false'
             });

        }
     });
        
      
  }

  componentDidMount(){

    var self = this;
      self.check();
  }
  render() {
  var self = this;
    return (
            <View style={styles.container}>
              <Text>{self.state.isConnected}</Text>
            </View>
    );

    
          
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RNSwiftCheckNetwork', () => RNSwiftCheckNetwork);
