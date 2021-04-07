import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;


public class testmain {
    public static void main(String[] args){
            int[] arr = {5,2,4,3,1};
            sort(5,arr);
//            for (int i=0;i<arr.length;i++){
//                System.out.print(arr[i]);
//            }
            arr = new int[]{5, 2, 4, 3, 1,6,9,7,8};
            maopaosort(5,arr);
            for (int i=0;i<arr.length;i++){
                System.out.print(arr[i]);
            }


    }

    static void sort(int n,int[] arr){//降序  //找出最大值，放在最左边
        for(int i=0;i<arr.length;i++){
            int max = i;
            for(int j=i+1;j<arr.length;j++){
                if(arr[j] >arr[max]){
                    max = j;
                }
            }
            swap(max,i,arr);//换位方法
        }
    }

    static void swap(int a1,int a2,int[] arr){
        int temp = arr[a1];
        arr[a1] = arr[a2];
        arr[a2] = temp;
    }
//952314678
    static void maopaosort(int n,int[] arr){//降序  //比较相邻的两个数，大的放左，小的放右，每次循环从首位开始
        for(int i=0;i<arr.length;i++){
            for(int j = 0;j<arr.length-i-1;j++){
                if(arr[j]<arr[j+1]){
                    swap(j,j+1,arr);//换位方法
                }
            }
        }
    }


    public void tts(){
        //
        ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");
        // Dispatch是做什么的？
        Dispatch sapo = sap.getObject();
        try {

            // 音量 0-100
            sap.setProperty("Volume", new Variant(100));
            // 语音朗读速度 -10 到 +10
            sap.setProperty("Rate", new Variant(1.5));

            Variant defalutVoice = sap.getProperty("Voice");

            Dispatch dispdefaultVoice = defalutVoice.toDispatch();
            Variant allVoices = Dispatch.call(sapo, "GetVoices");
            Dispatch dispVoices = allVoices.toDispatch();

            Dispatch setvoice = Dispatch.call(dispVoices, "Item", new Variant(1)).toDispatch();
            ActiveXComponent voiceActivex = new ActiveXComponent(dispdefaultVoice);
            ActiveXComponent setvoiceActivex = new ActiveXComponent(setvoice);

            Variant item = Dispatch.call(setvoiceActivex, "GetDescription");
            // 执行朗读
            for (int i =0;i<3;i++){
                Dispatch.call(sapo, "Speak", new Variant("welcome to my world"));
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sapo.safeRelease();
            sap.safeRelease();
        }
    }
}
