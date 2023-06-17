import { Dimensions, ImageBackground, StyleSheet, Text, View } from 'react-native';
import ConnectToHealthButton from './src/components/ConnectToHealthButton';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';
import { WavesBackground } from './assets';
import { StatusBar } from 'expo-status-bar';


export default function App() {
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container} edges={['top', 'right', 'left']}>
        <ImageBackground source={WavesBackground} style={styles.bgImage}>
          <ConnectToHealthButton />
        </ImageBackground>        
      </SafeAreaView>
      <StatusBar style="dark" />
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    boxSizing: 'border-box',
    display: 'flex',
    height: Dimensions.get('window').height,
    width: Dimensions.get('window').width,
    border: '1px solid red'
  },
  bgImage: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 10
  }
});
