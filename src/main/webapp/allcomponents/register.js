
const  form=document.getElementById('form');
const  fname= document.getElementById('fname');
const  email= document.getElementById('email');
const phno=document.getElementById('phno');
const password=document.getElementById('password');

function showError(input,message){
   const reg=input.parentElement;
   reg.className='registration error';
   const small=reg.querySelector('small');
   small.innerText=message;
}

function  showSuccess(input)
{
    const reg=input.parentElement;
    reg.className='registration success';

}

function checkEmail(input){
    const re=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (re.test(input.value.trim()))
    {
        showSuccess(input)
    }
    else {
        showError(input,'Email is invalid')
    }
}
function checkRequired(inputArr)
{
    inputArr.forEach(function (input)
    {
        if (input.value.trim()==='')
        {
            showError(input,`${getFieldName(input)} is required`)
        }
        else
        {
            showSuccess(input);
        }
    });
}

function  checkLength(input,min,max)
{
    if (input.value.length<min)
    {
        showError(input,`${getFieldName(input)} must be atleast ${min} character `)
    }
    else if (input.value.length>max)
    {
        showError(input,`${getFieldName(input)} must be less then${max} character`)
    }
    else
    {
        showSuccess(input);
    }
}
function checkPhoneLength(input,must)
{
    if (input.value.length !==10)
    {
        showError(input,`${getFieldName(input)} is invaild `)
    }
    else {
        showSuccess(input)
    }
}
function getFieldName(input){
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}
form.addEventListener('submit',function (e){
    e.preventDefault();

    checkRequired([fname,email,phno,password]);
    checkLength(fname,3,15);
    checkLength(password,6,15);
    checkEmail(email);
    checkPhoneLength(phno,10);

});
