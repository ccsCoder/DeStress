import { StyleSheet, Pressable, Text, Image } from "react-native"
import { noop } from "../utils/Utils"
import { HeartIcon } from "../../assets"

const styles = StyleSheet.create({
  button: {
    display: 'flex',
    flexDirection: 'row',
    width: '80%',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    paddingHorizontal: 32,
    borderRadius: 5,
    elevation: 3,
    border: '1px solid gray'
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
    width: 32
  }
})

export default function ConnectToHealthButton ({ label = 'Connect to Apple Health', onPress = noop }) {
  return (
    <Pressable style={styles.button} onPress={onPress}>
      <Text style={styles.text}> {label} </Text>
      <Image source={HeartIcon} style={styles.icon} accessible={false} height={32} width={32} />
    </Pressable>
  )
}
