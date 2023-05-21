//Coverting Date format
const convertDate = dateFormat => {
    let date = new Date(dateFormat);
    let m = (date.getMonth() + 1);
    let d = (date.getDate());
    return date.getFullYear() + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
};

const tomsaDateFormat = dateFormat =>{
    if(dateFormat){
        let dte =(typeof(dateFormat)==='string')? new Date(dateFormat): dateFormat;
        let strArray = [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ];
        let d = dte.getDate();
        let m = strArray[dte.getMonth()];
        let y = dte.getFullYear();
        return ''+(d<= 9?'0'+d:d)+'- '+m+'- '+y; 
    }
    else{
        return null;
    }
}
const tomsaDatetime = dateTime =>{
    if(dateFormat){
        let dte =(typeof(dateFormat)==='string')? new Date(dateFormat): dateFormat;
        let strArray = [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ];
        let d = dte.getDate();
        let m = strArray[dte.getMonth()];
        let y = dte.getFullYear();
     
}

export {
    convertDate,
    tomsaDateFormat
};