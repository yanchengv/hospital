AutoForm.hooks
  insertDoctorForm:
    onError: (operation, error)->
      console.log("添加失败" + error)
    onSuccess: ->
      console.log("onSuccess" )
      $("#addDoctorModal").modal 'hide'
    onSubmit:(insertDoc,updateDoc,currentDoc)->
      user=insertDoc.profile.userProfile
      newUserData={
        username: insertDoc.username
        password:user.password
        profile:
          userProfile:{
            name:user.name
            roles:[user.roles[0]]
            age:user.age
            gender:user.gender
            mobile:user.mobile

          }
          doctorProfile:{
            hospital_id:user.hospital_id
            department_id:user.department_id
          }
      }
      Accounts.createUser(newUserData)
      $("#addDoctorModal").modal 'hide'
