let cssArray=["globalCSS.css"];

if(cssArray.length>0)
{
    for(let i=0;i<cssArray.length;i++)
    {
        console.log("<link href=\""+cssArray[i]+" rel=\"stylesheet\"></link>");
    }
}