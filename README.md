# สรุปการลอง SonarQube on Local

Steps: [Quick Start: Local SonarQube Setup with Docker for JS/TS Projects.](https://medium.com/@s.klop/quick-start-local-sonarqube-setup-with-docker-for-js-ts-projects-2c1f19c24567)

## SonarQube on Local

- ใช้ Docker ในการ deploy web application ของ SonarQube บน Local
- ติดตั้ง SonarQube Scanner
  - ติดตั้งไม่สำเร็จ ติด error: `Could not find 'java' executable in JAVA_HOME or PATH.` - ลง JRE แล้วก็ไม่หาย
  - ใช้วิธี Docker sonar-scanner-cli ลงในเครื่องแทน
  - รันด้วยคำสั่งตามไฟล์ `run-sonar-scanner.bash`
    - ซึ่งต้อง generate access token จาก SonarQube ก่อน โดยแยกตาม project (ตามที่เข้าใจ)
- รันคำสั่งสำเร็จ & Analyze branch `develop` ผ่านแล้ว
- ติดที่ Free Edition ไม่สามารถเลือก branch ได้ ทำให้ต้องสร้าง sonarlint project ใหม่ และเชื่อมต่อกับ branch ที่ต้องการทุกครั้ง

## SonarLint in local

- ใช้ Docker รัน beevelop/sonarlint ในการตรวจสอบ code ใน local
- ปัญหาที่เจอตอนนี้
  - ไม่รู้จะต้อง setting ที่ไหน เพราะว่าเพิ่มใน properties แล้ว แต่ไม่เห็นเข้า (เพิ่มเรื่อง encoding ที่ตัวรันมันฟ้องว่าอ่านภาษาไทยไม่ได้)
  - มันพยายามรันทุกไฟล์ที่ตั้ง path ไว้ใน `/code` ทำให้ต้องมารัน `/apps` กับ `/libs` แยก ไม่งั้นมันจะเอา `node_modules` มาตรวจด้วย (ซึ่งอันนี้ลอง setting ใน properties แล้วเหมือนกัน ก็ไม่เห็นเข้า)
- แล้วหลังจากรันผ่าน ก็ไม่เห็นจะมี issue ขึ้นเลย แถมไฟล์ output ก็เป็นไฟล์ html ไม่เวิร์ค
- เหมือนเขาจะล็อค version sonar qube ใน Docker อันนี้ อาจจะทำให้ issue ไม่ขึ้น เพราะว่ามันเป็นของ 7 ปีก่อนแน่ะ

## สรุป

ใน Local ตอนนี้ไม่เวิร์ตด้วยประการทั้งปวง จริง ๆ มันเวิร์คแหละ แต่ effort ไม่น่าคุ้ม เพราะมัน filter error ที่เพิ่งเกิดกับ file ใน branch นี้ไม่ได้อะ ทำให้ไม่มีวิธีแยก error จากทีมเรา หรือไม่ก็ต้อง take effort ไปทำตรงนี้เยอะ ซึ่งก็คิดไม่ออก 555555555555
