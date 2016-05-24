import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;

class Connect{

    public static void main(String args[]) {
        try {
		
			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";
			
		    KVStore store;
						
			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
            
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");
					
            store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
        }
		catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}
