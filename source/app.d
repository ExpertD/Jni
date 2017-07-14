import jni.jni;

extern (C) {
	int printf(const(char)*, ...);
	void Java_Test_sayHello(JNIEnv* env, jclass jc) {
		printf("Hello world!".ptr);
	}
}
