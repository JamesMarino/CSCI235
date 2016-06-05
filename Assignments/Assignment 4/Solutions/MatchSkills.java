import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import oracle.kv.KeyValueVersion;
import oracle.kv.Direction;
import java.util.ArrayList;
import java.util.Iterator;

class MatchSkills
{
	private static KVStore store;
	
    public static void main(String args[]) {
        try {
		
			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";
								
			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
			
			// while (applicantIterator.hasNext()) {

				// Loop through sneeded

				// Loop through spossessed

				// Check spossessed skill level >= sneeded skill level

			// }
			
            store.close();
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
    }
}
