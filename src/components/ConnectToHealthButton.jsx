import { StyleSheet, Pressable, Text, Image, View } from "react-native"
import { noop } from "../utils/Utils"
import { HeartIcon } from "../../assets"

const styles = StyleSheet.create({
  buttonView: {
    maxWidth: '80%',
    borderWidth: 1,
    borderStyle: 'solid',
    borderColor: 'gray',
    borderRadius: 5,
    paddingVertical: 12,
    paddingHorizontal: 32,
  },
  button: {
    display: 'flex',
    flexDirection: 'row',
    flexWrap: 'nowrap',
    alignItems: 'center',
    justifyContent: 'center',
    elevation: 3
  },
  text: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
  },
  icon: {
    marginLeft: 10, 
    height: 32,
    width: 32,
  }
})

export default function ConnectToHealthButton ({ label = 'Connect to Apple Health', onPress = noop }) {
  return (
    <View style={styles.buttonView}>
      <Pressable onPress={onPress} style={styles.button}>
        <Text style={styles.text}> {label} </Text>
        <Image source={HeartIcon} style={styles.icon} accessible={false} height={32} width={32} />
      </Pressable>
    </View>
  )
}
