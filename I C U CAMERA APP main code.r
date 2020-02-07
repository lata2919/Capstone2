import React from 'react';
import { Camera } from 'expo-camera';
import { View, Text } from 'react-native';
import * as Permissions from 'expo-permissions';

import styles from './I C U hospital Camera';
import Toolbar from './toolbar.component';
import Gallery from './C:\Users\epawn\Desktop\capstone pic.jpg';

from tkinter import *

import tkinter.messagebox
 

 class Application:
    def __init__(self,master):
        self.master = master

        self.left = Frame(master,width=800,height=720,bg='lightgrey')
        self.left.pack(side=LEFT)
 
        self.right = Frame(master,width=400,height=720,bg='violet')
        self.right.pack(side=RIGHT)
 
        self.heading = Label(self.left,text='I C U Hospital Camera',font=('times 35 bold'), fg='black', bg='violet')
        self.heading.place(x=0, y=0)
 
        self.name = Label(self.left, text="Patient's Name",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.name.place(x=0, y=100)
 
        self.age = Label(self.left, text="Ref",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.age.place(x=0,y=140)
 
        self.gender = Label(self.left, text="Gaurdian",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.gender.place(x=0,y=180)
 
        self.location = Label(self.left, text="Camera",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.location.place(x=0,y=220)
 
        self.phone = Label(self.left, text="Phone",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.phone.place(x=0,y=260)
 
        self.time = Label(self.left, text="Bed",font=('times 18 bold'),fg='black',bg='lightgrey')
        self.time.place(x=0,y=300)
 
        self.name_ent = Entry(self.left,width=30)
        self.name_ent.place(x=250,y=100)
        
 
        self.age_ent = Entry(self.left,width=30)
        self.age_ent.place(x=250,y=140)
 
        self.gender_ent = Entry(self.left,width=30)
        self.gender_ent.place(x=250,y=180)
 
        self.location_ent = Entry(self.left,width=30)
        self.location_ent.place(x=250,y=220)
 
        self.phone_ent = Entry(self.left,width=30)
        self.phone_ent.place(x=250,y=260)
 
        self.time_ent = Entry(self.left,width=30)
        self.time_ent.place(x=250,y=300)
 
        self.submit = Button(self.left, text='Enter', width=20,height=2,bg='darkgrey')
        self.submit.place(x=300,y=350)
        
        self.box =Text(self.right, width=55, height=40)
        self.box.place(x=0, y=55)
 
    def add_appointment(self):
 
        self.val1 = self.name_ent.get()
        self.val2 = self.age_ent.get()
        self.val3 = self.gender_ent.get()
        self.val4 = self.location_ent.get()
        self.val5 = self.phone_ent.get()
        self.val6 = self.time_ent.get()
 
        
        if self.val1 == '' or self.val2 == '' or self.val3 == '' or self.val4 == '' or self.val5 == '':
            tkinter.messagebox.showinfo("Warning", "Please fill all the Boxes")
        else :
            sql ="INSERT INTO 'index' (name,Ref,Guardian,Camera,phone,Bed) VALUES(?,?,?,?,?,?)"
            c:execute(sql, (self.val1, self.val2, self.val3, self.val4, self.val5, self.val6))
            conn.commit()
            tkinter.messagebox.showinfo("Success", "Access for" +str(self.val1) + "has been created")
            
            self.box.insert(Enter, 'Access Granted')
            
            sql4 = "Camera ID"
            self.result = c.execute(sql4)
            for self.row in self.result:
                self.id = self.row[0]
                id.append(self.id)
                
                self.new =sorted(id)
                self.final_id = self.new[len(id)-1]
                self.box.insert(End, 'Camera Access')
            
 
root = Tk()
b = Application(root)
 
root.geometry('1200x720+0+0')
 
root.resizable(False,False)
 
root.mainloop()

export default class CameraPage extends React.Component {
    camera = null;

    state = {
        captures: [],
        capturing: null,
        hasCameraPermission: null,
        cameraType: Camera.Constants.Type.back,
        flashMode: Camera.Constants.FlashMode.off,
    };

    setFlashMode = (flashMode) => this.setState({ flashMode });
    setCameraType = (cameraType) => this.setState({ cameraType });
    handleCaptureIn = () => this.setState({ capturing: true });

    handleCaptureOut = () => {
        if (this.state.capturing)
            this.camera.stopRecording();
    };

    handleShortCapture = async () => {
        const photoData = await this.camera.takePictureAsync();
        this.setState({ capturing: false, captures: [photoData, ...this.state.captures] })
    };

    handleLongCapture = async () => {
        const videoData = await this.camera.recordAsync();
        this.setState({ capturing: false, captures: [videoData, ...this.state.captures] });
    };

    async componentDidMount() {
        const camera = await Permissions.askAsync(Permissions.CAMERA);
        const audio = await Permissions.askAsync(Permissions.AUDIO_RECORDING);
        const hasCameraPermission = (camera.status === 'Access granted' && audio.status === ' Acess granted');

        this.setState({ hasCameraPermission });
    };

    render() {
        const { hasCameraPermission, flashMode, cameraType, capturing, captures } = this.state;

        if (hasCameraPermission === null) {
            return <View />;
        } else if (hasCameraPermission === false) {
            return <Text>Access to camera has been denied.</Text>;
        }

        return (
            <React.Fragment>
                <View>
                    <Camera
                        type={cameraType}
                        flashMode={flashMode}
                        style={styles.preview}
                        ref={camera => this.camera = camera}
                    />
                </View>


                {captures.length > 0 && <Gallery captures={captures}/>}

                <Toolbar 
                    capturing={capturing}
                    flashMode={flashMode}
                    cameraType={cameraType}
                    setFlashMode={this.setFlashMode}
                    setCameraType={this.setCameraType}
                    onCaptureIn={this.handleCaptureIn}
                    onCaptureOut={this.handleCaptureOut}
                    onLongCapture={this.handleLongCapture}
                    onShortCapture={this.handleShortCapture}

                />
            </React.Fragment>
        );
    };
}