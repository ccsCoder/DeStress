import { Dimensions, ImageBackground, StyleSheet, Text, View } from 'react-native';
import ConnectToHealthButton from './src/components/ConnectToHealthButton';
import { WavesBackground } from './assets';

export default function App() {
  return (
    <View style={styles.container}>
      <ImageBackground source={WavesBackground} resizeMode='cover' style={styles.backgroundImage}>
        <ConnectToHealthButton />
        <Text>We use health data to check your heart rate variance.</Text>
      </ImageBackground>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    // alignItems: 'center',
    // justifyContent: 'center',
    zIndex: 1
  },
  backgroundImage: {
    display: 'grid',
    gridTemplateRows: 'auto',
    gridTemplateColumns: '1fr 2fr 1fr',
    placeItems: 'center',
    height: Dimensions.get('window').height,
    width: Dimensions.get('window').width,
    zIndex: 0
  }
});
