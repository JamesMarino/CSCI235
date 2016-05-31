import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import java.util.ArrayList;

class Transfer
{

    public static void main(String args[])
    {
        try
        {

            String storeName = "kvstore";
            String hostName = "localhost";
            String hostPort = "5000";

            KVStore store;

            ArrayList<String> majorList = new ArrayList<String>();
            ArrayList<String> minorList = new ArrayList<String>();
            Key key;
            Value value;
            String valueString;

            store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost" + ":" + "5000"));
            System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");

            //players
            majorList.add("Dave");
            majorList.add("Barranquero");
            majorList.add("07012012");
            minorList.add("My Team");
            minorList.add("Wollongong");
            minorList.add("Chinese");
            valueString = "Nat:Chinese;Country:Australia;WhenTras:17/10/2007";
            key = Key.createKey(majorList, minorList);
            value = Value.createValue(valueString.getBytes());
            store.put(key, value);
            majorList.clear();
            minorList.clear();







            store.close();
            System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
        }
        catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}